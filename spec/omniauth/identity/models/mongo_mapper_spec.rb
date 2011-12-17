require 'spec_helper'

describe(OmniAuth::SimpleIdentity::Models::MongoMapper, :db => true) do
  class MongoMapperTestIdentity
    include MongoMapper::Document
    include OmniAuth::SimpleIdentity::Models::MongoMapper
    auth_key :ham_sandwich
  end

  it 'should locate using the auth key using a where query' do
    MongoMapperTestIdentity.should_receive(:where).with('ham_sandwich' => 'open faced').and_return(['wakka'])
    MongoMapperTestIdentity.locate('open faced').should == 'wakka'
  end
end
