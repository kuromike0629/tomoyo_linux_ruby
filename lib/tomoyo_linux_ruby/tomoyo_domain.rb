module TomoyoLinuxRuby
  class TomoyoDomain
    attr_reader :name, :file, :use_group, :misc, :network, :task,:quota_exceeded,:transition_failed
    attr_accessor :use_profile

    def initialize(domain)
      @name = domain
      @use_group = nil
      @use_profile = nil
      @file = Hash.new
      @file[:execute] = Array.new
      @file[:read] = Array.new
      @file[:write] = Array.new
      @file[:append] = Array.new
      @file[:getattr] = Array.new
      @file[:create] = Array.new
      @file[:unlink] = Array.new
      @file[:chown] = Array.new
      @file[:chgrp] = Array.new
      @file[:chmod] = Array.new
      @file[:mkdir] = Array.new
      @file[:rmdir] = Array.new
      @file[:mkfifo] = Array.new
      @file[:mksock] = Array.new
      @file[:mkblock] = Array.new
      @file[:mkchar] = Array.new
      @file[:truncate] = Array.new
      @file[:symlink] = Array.new
      @file[:link] = Array.new
      @file[:rename] = Array.new
      @file[:ioctl] = Array.new
      @file[:mount] = Array.new
      @file[:unmount] = Array.new
      @file[:chroot] = Array.new
      @file[:pivot_root] = Array.new
      @misc = Hash.new
      @misc[:env] = Array.new
      @network = Hash.new
      @network[:inet] = Array.new
      @network[:unix] = Array.new
      @task = Hash.new
      @task[:manual_domain_transition] = Array.new
      @quota_exceeded = false
      @transition_failed = false
    end

    def add_policy(policy)
      #Add 1 Line Policy
      parsed_policy = policy.split(" ")
      case parsed_policy[0]
      when 'use_group'
        @use_group = parsed_policy[1].to_i
      when 'use_profile'
        @use_profile = parsed_policy[1].to_i
      when 'file'
        if @file.has_key?(parsed_policy[1].to_sym) then
          @file[parsed_policy[1].to_sym].push(parsed_policy[2..-1])
        end
      when 'misc'
        if @misc.has_key?(parsed_policy[1].to_sym) then
          @misc[parsed_policy[1].to_sym].push(parsed_policy[2..-1])
        end
      when 'network'
        if @network.has_key?(parsed_policy[1].to_sym) then
          @network[parsed_policy[1].to_sym].push(parsed_policy[2..-1])
        end
      when 'task'
        if @task.has_key?(parsed_policy[1].to_sym) then
          @task[parsed_policy[1].to_sym].push(parsed_policy[2..-1])
        end
      when 'quota_exceeded'
        @quota_exceeded = true
      when 'transition_failed'
        @transition_failed = true
      else
        return false
      end
      return true
    end

    def add_policies(policies)
      policies.lines do |s|
        add_policy(s)
      end
    end

    def to_s
      ret_s = ''
      ret_s << @name
      #Linked use_group
      if @use_group != nil then
        ret_s << 'use_group' << ' ' << @use_group.to_s << "\n"
      end
      #Linked use_profile
      if @use_profile != nil then
        ret_s << 'use_profile' << ' ' << @use_profile.to_s << "\n"
      end
      #Linked file
      @file.each do |key,policies|
        policies.each do |policy|
          ret_s << 'file' << ' ' << key.to_s
          policy.each{|i| ret_s << ' ' << i}
          ret_s << "\n"
        end
      end
      #Linked misc
      @misc.each do |key,policies|
        policies.each do |policy|
          ret_s << 'misc' << ' ' << key.to_s
          policy.each{|i| ret_s << ' ' << i}
          ret_s << "\n"
        end
      end
      #Linked network
      @network.each do |key,policies|
        policies.each do |policy|
          ret_s << 'network' << ' ' << key.to_s
          policy.each{|i| ret_s << ' ' << i}
          ret_s << "\n"
        end
      end
      #Linked task
      @task.each do |key,policies|
        policies.each do |policy|
          ret_s << 'task' << ' ' << key.to_s
          policy.each{|i| ret_s << ' ' << i}
          ret_s << "\n"
        end
      end
      #Linked quota_exceeded flag
      if @quota_exceeded then
        ret_s << "quota_exceeded\n"
      end

      #Linked transition_failed
      if @transition_failed then
        ret_s << "transition_failed\n"
      end
      return ret_s
    end
  end
end
