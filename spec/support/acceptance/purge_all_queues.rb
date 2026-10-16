# frozen_string_literal: true

def purge_all_queues
  request = '{
    OPERATION CUPS-Get-Printers
    GROUP operation
    ATTR charset attributes-charset utf-8
    ATTR language attributes-natural-language en
    DISPLAY printer-name
  }'
  result = shell('ipptool -t ipp://localhost/ /dev/stdin', stdin: request, acceptable_exit_codes: [0, 1])
  queues = result.stdout.scan(%r{printer-name \(nameWithoutLanguage\) = ([^\s"'\\,#/]+)})
  remove_queues(queues)
end
