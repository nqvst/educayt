class DisplayableNotification

  def initialize(o)
    @verb = o.verb
    @subject = o.subject
    @adjective = o.adjective
    @object = o.object_
    @type_name = o.type_name
  end

  def get_notification_link
     sentence =  get_sentence
  end

  private
  
  def get_sentence
    return @subject + ' ' + @verb + ' ' + @adjective + ' ' + @object
  end

  def make_link
    
  end


end
