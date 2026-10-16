# frozen_string_literal: true

def add_printers(*names)
  names.each do |name|
    shell("lpadmin -p #{Shellwords.escape(name)} -m drv:///sample.drv/generic.ppd -o printer-is-shared=false")
  end
end
