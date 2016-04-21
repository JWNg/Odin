require 'spec_helper'
require 'CC'


RSpec.describe "caesar_cipher" do
  
  it "shifts the letters n spots" do
    test = caesar_cipher("ABC", 3)
    expect(test).to eq"DEF"
  end
  
  it "spaces are returned as spaces" do
    space = caesar_cipher("A B C", 5)
    expect(space).to eq("F G H")
  end
  
  it "lowercase z loops back to lowercase a" do
    case_sensitive_loop = caesar_cipher("xyz", 3)
    expect(case_sensitive_loop).to eq("abc")
  end
  
  it "uppercase Z loops back to uppercase A" do
    case_sensitive_loop = caesar_cipher("XYZ", 3)
    expect(case_sensitive_loop).to eq("ABC")
  end
  
  it "shifts punctuation and numbers" do
    numbers_and_others = caesar_cipher("123 !@#", 3)
    expect(numbers_and_others).to eq("456 $C&")
  end
end

