module AI
  class Rule_Set
    # placeholder

    def self.hours_passed
      require "rules_ai"; RulesAi::Rules_Set.hours_passed
    end

    def self.tesla_multiplication
      require "rules_ai"; RulesAi::Rules_Set.tesla_multiplication
    end

    def self.autonomous_prompting
      require "rules_ai"; RulesAi::Rules_Set.autonomous_prompting
    end

    def self.mixed_13
      require "rules_ai"; RulesAi::Rules_Set.mixed_13
    end

    def self.write_poetry
      require "rules_ai"; RulesAi::Rules_Set.write_poetry
    end

    def self.estimate_digest
      require "rules_ai"; RulesAi::Rules_Set.estimate_digest
    end

    def self.calculate_hyper
      require "rules_ai"; RulesAi::Rules_Set.calculate_hyper
    end

  end
end

module DynamicBaysian
  class MachineLearning
    # placeholder

    def self.greeting
      require "MLForms"; MLForms::Multifactor.greeting
    end

    def self.agent
      require "MLForms"; MLForms::Multifactor.agent
    end

    def self.request
      require "MLForms"; MLForms::Multifactor.request
    end

    def self.gender
      require "MLForms"; MLForms::Multifactor.gender
    end

    def self.object
      require "MLForms"; MLForms::Multifactor.object
    end

    def self.for_from
      require "MLForms"; MLForms::Multifactor.for_from
    end

    def self.direction
      require "MLForms"; MLForms::Multifactor.direction
    end

  end
end

require "finite_machine"

fm = FiniteMachine.new do
  event :init,  :none     => :ai_rule
  event :rules, :ai_rule  => :ai_learn
  event :learn, :ai_learn => :ai_rule


  on_enter(:ai_rule) { |event|
    AI::Rule_Set.hours_passed; sleep(1)
    AI::Rule_Set.tesla_multiplication; sleep(1)
    AI::Rule_Set.autonomous_prompting; sleep(1)
    AI::Rule_Set.mixed_13; sleep(1)
    AI::Rule_Set.write_poetry; sleep(1)
    AI::Rule_Set.estimate_digest; sleep(1)
    AI::Rule_Set.calculate_hyper; sleep(1)
  }

  on_enter(:ai_learn) { |event|
    DynamicBaysian::MachineLearning.greeting
    DynamicBaysian::MachineLearning.agent
    DynamicBaysian::MachineLearning.request
    DynamicBaysian::MachineLearning.gender
    DynamicBaysian::MachineLearning.object
    DynamicBaysian::MachineLearning.for_from
    DynamicBaysian::MachineLearning.direction
  }
end

fm.init

while true
  fm.learn; sleep(1)

  fm.rules; sleep(1)
end
