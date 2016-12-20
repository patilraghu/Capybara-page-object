#encoding: utf-8
#
# Cucumber swallows exceptions in Before hook
# https://github.com/cucumber/cucumber/issues/60

Before do
  begin
    @test_start = Time.now-(60*60*24*7)
  rescue Exception => e
    $before_hook_exception = e
    raise e
  end
end

After do |scenario|
  # Cucumber calls after hook twice sometimes so this statement prevents duplicate processing
  if (@last_scenario != scenario)
    @last_scenario = scenario
    # post scenario step, e.g. database teardown
  end
end

at_exit do |scenario|
#  report_exceptions_from_before_hook
  # steps to complete at the end of execution
  # e.g. disconnet from DB
end

def report_exceptions_from_before_hook
  if $before_hook_exception
    e = $before_hook_exception
    # Prevent this error being reported more than once
    $before_hook_exception = nil
    $stderr.puts
    $stderr.puts 'Error encountered in before hook'
    raise e
  end
end
