module TomoyoLinuxRuby
  class TomoyoPolicy
    def initialize(policy="current")
      #Initializes policy classes
      #This Gem working on TOMOYOLinux Version 2.5.X
      #Testing on Ubuntu 16.04
      @policy = policy
      if policy == "kernel" then
        @location = "/sys/kernel/security/tomoyo/domain_policy"
      else
        @location = "/etc/tomoyo/policy/%s/domain_policy.conf" % policy
      end
      @domains = Array.new
    end
    def apply
      #Apply edited policy.
      #This function is for only kernel policy.
      #If policy is system's return False.
      begin
        o, e, s = Open3.capture3("/usr/sbin/tomoyo-loadpolicy -df",stdin_data: to_s)
      rescue Errno::ENOENT
        return false
      end
        return true
    end

    def load
      #Load policy from the kernel.
      #If editing policy, overwrite it.
      import()
    end

    def to_s
      #Return Current edited policy.
      ret = ''
      @domains.each do |d|
        ret << d.to_s << "\n"
      end
      return ret
    end

    def import(policy_location=@location,merge_flag=false)
      #Import domain policy from the files
      #If merge_flag is True, merge current kernel and merge.
      #Return array of domains.
      ret = []
      begin
        File.open(policy_location,'r') do |f|
          f.each_line do |line|
            if line.split(' ')[0] == "<kernel>" then
              ret.push(TomoyoLinuxRuby::TomoyoDomain.new(line))
            else
              ret[-1].add_policy(line)
            end
          end
        end
      rescue
        return false
      end
      #If Flag is true
      if merge_flag then
        @domains.concat(ret)
      else
        @domains = ret
      end
      return true
    end

    def export(filepath)
      #Export current policy as a file
      File.open(filepath,"w") do |f|
        f.puts to_s
      end
    end
  end
end