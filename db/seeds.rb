# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ContentType.find_or_create_by(content_type: 'Email', description: 'Email to generate content',
                           template: 'Write an email in English with a subject line that is targeted to the <business_customer_subtype> and is focussed on the topic of the top <topic_quantity> <content_topic> that every <business_ideal_customer> must <avoid|know|accomplish etc> in order to <business_customer_subtype_result>.')
Content.find_or_create_by(business_ideal_customer: 'non-techincal',
                       business_problem_solved: 'applications',
                       output_language: nil,
                       content_topic: 'Problems',
                       topic_quantity: 4,
                       business_customer_subtype: 'small business owner',
                       business_customer_subtype_needs: nil,
                       business_customer_subtype_result: 'avoid failure when implementing technology for their business')
