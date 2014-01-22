require 'spec_helper'
require 'kana_phone'

describe KanaPhone do
  context 'translate from kana to phone' do
    it 'should translated' do
      conv = KanaPhone.new
      conv.kana2phone_text('いいてんきだ').should == 'i i t e N k i d a'
      conv.kana2phone_text('かったーないふ').should == 'k a q t a: n a i f u'
    end
  end
end
