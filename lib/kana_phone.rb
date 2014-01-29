# coding: utf-8
require 'csv'
require 'nkf'
require 'version'

class KanaPhone
  CONV_DATA = File.expand_path('../', __FILE__) + '/kana-phone.csv'
  MAX_KANALEN = 2

  def initialize
    @kana2phone = {}
    table = CSV.table CONV_DATA

    table.each do |r|
      @kana2phone[r[:kana]] = r[:phone]
    end
  end

  def hira2kata(text)
    NKF.nkf('--katakana -w', text)
  end

  def kana2phone(text)
    b = 0
    result = []

    while true
      # 長い方からマッチさせる
      MAX_KANALEN.downto(1) do |l|
        # 部分文字列を取り出し
        kana = text.slice(b, l)

        # 長音
        if kana == 'ー'
          # 1つ前に:をつける
          prev = result.pop
          prev[:phone] = prev[:phone] + ':'
          result.push(prev)

          b += l
          break
        end

        # 変換
        if phone = @kana2phone[kana]
          result.push({kana: kana, phone: phone})

          b += l
          break
        end

        # テーブルにない文字は読み飛ばす
        b += 1 if l == 1
      end

      break if b >= text.length
    end

    return result
  end 

  def kana2phone_text(text)
    result = kana2phone(hira2kata(text))
    result.map {|h| h[:phone] }.join(' ')
  end
end

