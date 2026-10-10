def add_printers_to_classes(class_members)
  add_printers('Dummy')
  class_members.each_key do |classname|
    members = class_members[classname]
    members = %w[Dummy] if members.empty?
    members.each do |printername|
      shell("lpadmin -p #{Shellwords.escape(printername)} -c #{Shellwords.escape(classname)}")
    end
    shell("lpadmin -p #{Shellwords.escape(classname)} -o printer-is-shared=false")
  end
  remove_queues('Dummy')
end
