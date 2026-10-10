def remove_queues(*names)
  names.flatten.each do |name|
    shell("lpadmin -x #{Shellwords.escape(name)}", acceptable_exit_codes: [0, 1])
  end
end
