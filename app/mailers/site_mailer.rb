class SiteMailer < ApplicationMailer
  def demo_request(demo_request, referer)
    @demo_request = demo_request
    @page         = referer

    mail to:       '"Wavetronix Sales", <sales@wavetronix.com>',
         reply_to: %("#{@demo_request.name}" <#{@demo_request.email}>),
         subject:  t('.subject')
  end

  def knowledge_base_article_feedback(article, feedback)
    @article  = article
    @feedback = feedback
    mail to:      '"Technical Support" <andrew.porter@wavetronix.com>',
         subject: t('.subject')
  end

  def marketing_app_support_request(marketing_app_support_request)
    @marketing_app_support_request = marketing_app_support_request
    mail to:    '"Marketing App Support" <appsupport@wavetronix.com>',
         reply_to: %("#{@marketing_app_support_request.name}" <#{@marketing_app_support_request.email}>),
         subject:  t('.subject')
  end

  def training_event_request(training_event_request, training_courses)
    @training_event_request = training_event_request
    @training_courses = training_courses
    mail to: '"Training" <jeremy.conterio@wavetronix.com>',
         reply_to: %("#{@training_event_request.company_name}" <#{@training_event_request.email}>),
         subject: t('.subject')
  end

  def enrollment(training_event_id, training_event_course_ids, email)
    @training_event = TrainingEvent.find(training_event_id)
    @training_event_courses = TrainingEventCourse.find(training_event_course_ids)


    mail to: %("Registration Confirmation" <#{email}>),
         replay_to: '"Training" <jeremy.conterio@wavetronix.com>',
         subject: 'Course Enrollment Confirmation'
  end
end
