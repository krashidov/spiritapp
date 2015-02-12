# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
org           = FactoryGirl.create(:organization)
user          = FactoryGirl.create(:user, organization: org, password: 'password', password_confirmation: 'password', email: 'k69@k.com')
default_tasks = FactoryGirl.create(:default_task, organization: org)
client        = FactoryGirl.create(:client, organization: org)
provider      = FactoryGirl.create(:provider, organization: org)
careplan      = FactoryGirl.create(:careplan, organization: org, client: client, provider: provider)
default_task  = FactoryGirl.create(:default_task, organization: org)
task          = FactoryGirl.create(:task, organization: org, default_task: default_task, careplan: careplan)

