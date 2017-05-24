require 'rails_helper'

describe MaintenanceRequestComment do
  subject { build( :maintenance_request_comment ) }

  it { should validate_presence_of :maintenance_request_id }
  it { should validate_presence_of :body }
  it { should validate_presence_of :author_id }

  it { should belong_to :author }
  it { should belong_to :maintenance_request }
end
