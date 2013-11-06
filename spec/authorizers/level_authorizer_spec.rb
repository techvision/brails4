require 'spec_helper'

describe LevelAuthorizer do
  let(:user) { FactoryGirl.build(:user)}
  let(:admin) { FactoryGirl.build(:admin)}
  let(:admin_resource_instance) { FactoryGirl.build(:level)}

  describe "class" do
    context "admin user" do
      it "lets admins create admin_resource_instances" do
        expect(admin_resource_instance.authorizer).to be_creatable_by(admin)
      end

      it "lets admins read admin_resource_instances" do
        expect(admin_resource_instance.authorizer).to be_readable_by(admin)
      end

      it "lets admins update admin_resource_instances" do
        expect(admin_resource_instance.authorizer).to be_updatable_by(admin)
      end

      it "lets admins delete admin_resource_instances" do
        expect(admin_resource_instance.authorizer).to be_deletable_by(admin)
      end
    end

    context "non-admin user" do
      it "does not let users create admin_resource_instances" do
        expect(admin_resource_instance.authorizer).not_to be_creatable_by(user)
      end

      it "does let users read admin_resource_instances" do
        expect(admin_resource_instance.authorizer).to be_readable_by(user)
      end

      it "does not let users update admin_resource_instances" do
        expect(admin_resource_instance.authorizer).not_to be_updatable_by(user)
      end

      it "does not let users delete admin_resource_instances" do
        expect(admin_resource_instance.authorizer).not_to be_deletable_by(user)
      end
    end
  end
end