def script_rules
  system("cd ai_scripter; ruby .scripter_seed.rb")
  
  puts "New self referenced method is scripted for rule set..."
end
  
def script_ml
  system("cd ml_scripter; ruby .scripter_seed.rb")
  
  puts "New self referenced method is scripted for machine learning..."
end

require "finite_machine"

ai = FiniteMachine.new do
  event :init,     :none    => :ruleset
  event :rules,    :ruleset => :baysian
  event :classify, :baysian => :none
  
  on_enter(:rules)    { |event| script_rules }
  on_enter(:classify) { |event| script_ml    }
end

ai.init

puts "The current process is #{ai.current}"

ai.rules

puts "The current process is #{ai.current}"

ai.classify

puts "The current process is #{ai.current}"
