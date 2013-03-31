require 'spec_helper'

describe LuhnHelper do
  describe 'methods' do
    it { helper.sum_luhn(4561261212345467).should === 60 }
    it { helper.sum_luhn(4561261212345468).should === 61 }
    it { helper.check_credit_card(4561261212345467).should === true }
    it { helper.check_credit_card(4561261212345468).should === false }
    it { helper.number_with_sum_luhn(4561261212345467).should === 456126121234546760 }
  end
end
