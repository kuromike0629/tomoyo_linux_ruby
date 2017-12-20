module TomoyoLinuxRuby
  class TomoyoPolicy
    attr_accessor :domains
    attr_reader :location, :policy
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
      o, e, s = Open3.capture3("/usr/sbin/tomoyo-loadpolicy -df",stdin_data: to_s)
    end

    def get_policy(domain_name)
      #get policy of domain
      @domains.each do |d|
        if d.name == domain_name then
          return d.to_s
        end
      end
      return false
    end

    def get_domain_tree(base_domain)
      #Return Domain which include base_domain
      ret = []
      @domains.each do |d|
        if d.name.include?(base_domain) then
          ret.push(d)
        end
      end
      return ret
    end

    def set_profile(domain_name,profile)
      #set_profile for domain
      @domains.each do |d|
        if d.name == domain_name then
          d.use_profile = profile
        end
      end
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
      File.open(policy_location,'r') do |f|
        f.each_line do |line|
          if line.split(' ')[0] == "<kernel>" then
            ret.push(TomoyoLinuxRuby::TomoyoDomain.new(line))
          else
            ret[-1].add_policy(line)
          end
        end
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
        f.puts self.to_s
      end
    end
  end
end
