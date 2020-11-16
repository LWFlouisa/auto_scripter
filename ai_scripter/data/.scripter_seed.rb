## Allows the AI to pick a module name, class name, and method name.
module_number = File.read("data/ai_input/module_input.txt").strip.to_i
class_number  = File.read("data/ai_input/class_input.txt").strip.to_i
method_number = File.read("data/ai_input/method_input.txt").strip.to_i

## Available module, class, and method names.
module_names     = File.readlines("data/script_parts/module_names.txt")
class_names      = File.readlines("data/script_parts/class_names.txt")
method_names     = File.readlines("data/script_parts/method_names.txt")

# Create different reset limits.
module_limit = module_names.size.to_i
class_limit  = class_names.size.to_i
method_limit = method_names.size.to_i

# Safety Reset for module list.
if module_number > module_limit
  module_number = 0
end

# Safety Reset for class list.
if class_number > class_limit
  class_number = 0
end

# Safety Reset for method list.
if method_number > method_limit
  method_number = 0
end

# AI chooses a module, class, and method name.
current_module = module_names[module_number].strip
current_class  = class_names[class_number].strip

current_method = method_names[method_number].strip

# Read in archive of old method list.
method_archive = File.read("data/script_archive/old_methods.txt").strip

# Read in the possible script types.
script_type    = File.readlines("data/script_parts/script_types.txt")
current_script = script_type[method_number].strip

# Module Call Archive
module_call_archive = File.read("data/script_archive/old_module_call.txt").strip

module_list = "module #{current_module}"

class_list  = "  class #{current_class}"

total_methods = "    #{method_archive}

    def self.#{current_method}
      #{current_script}
    end
"

end_script = "
  end
end

#{module_call_archive}
#{current_module}::#{current_class}.#{current_method}
"

# Writes current method list to old methods to referring back to.
open("data/script_archive/old_methods.txt", "w") { |f|
  f.puts total_methods
}

# Write a generated script in Ruby.
open("script.rb", "w") { |f|
  f.puts module_list
  f.puts class_list
  f.puts total_methods
  f.puts end_script
}

# Archive the old module caller.
open("data/script_archive/old_module_call.txt", "w") { |f|
  f.puts "#{current_module}::#{current_class}.#{current_method}"
}

# Marks off previous module, class, method, and script type and progresses.
open("data/ai_input/method_input.txt", "w") { |f|
  f.puts method_number = method_number + 1
}
