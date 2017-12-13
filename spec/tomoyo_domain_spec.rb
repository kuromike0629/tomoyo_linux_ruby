RSpec.describe TomoyoLinuxRuby::TomoyoDomain do
  #Use Group
  it 'Add use_group Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('use_group 2')
    expect(d.to_s).to include "<kernel>\nuse_group 2\n"
  end
  #Use Profile
  it 'Add use_profile Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('use_profile 2')
    expect(d.to_s).to include "<kernel>\nuse_profile 2\n"
  end
  #File Policy Test
  it 'Add file execute Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file execute /bin/ls')
    expect(d.to_s).to include "<kernel>\nfile execute /bin/ls\n"
  end
  it 'Add file read Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file read proc:/meminfo')
    expect(d.to_s).to include "<kernel>\nfile read proc:/meminfo\n"
  end
  it 'Add file write Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file write /dev/null')
    expect(d.to_s).to include "<kernel>\nfile write /dev/null\n"
  end
  it 'Add file append Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file append /var/log/auth.log')
    expect(d.to_s).to include "<kernel>\nfile append /var/log/auth.log\n"
  end
  it 'Add file getattr Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file getattr /dev/null')
    expect(d.to_s).to include "<kernel>\nfile getattr /dev/null\n"
  end
  it 'Add file create Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file create /var/lock/subsys/crond 0644')
    expect(d.to_s).to include "<kernel>\nfile create /var/lock/subsys/crond 0644\n"
  end
  it 'Add file unlink Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file unlink /var/lock/subsys/crond')
    expect(d.to_s).to include "<kernel>\nfile unlink /var/lock/subsys/crond\n"
  end
  it 'Add file chown Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file chown /dev/sda 0')
    expect(d.to_s).to include "<kernel>\nfile chown /dev/sda 0\n"
  end
  it 'Add file chgrp Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file chgrp /dev/audio 92')
    expect(d.to_s).to include "<kernel>\nfile chgrp /dev/audio 92\n"
  end
  it 'Add file chmod Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file chmod /dev/mem 0644')
    expect(d.to_s).to include "<kernel>\nfile chmod /dev/mem 0644\n"
  end
  it 'Add file mkdir Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file mkdir /tmp/logwatch.\*/ 0755')
    expect(d.to_s).to include "<kernel>\nfile mkdir /tmp/logwatch.\\*/ 0755\n"
  end
  it 'Add file rmdir Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file rmdir /tmp/logwatch.\*/')
    expect(d.to_s).to include "<kernel>\nfile rmdir /tmp/logwatch.\\*/\n"
  end
  it 'Add file mkfifo Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file mkfifo /dev/initctl 0644')
    expect(d.to_s).to include "<kernel>\nfile mkfifo /dev/initctl 0644\n"
  end
  it 'Add file mksock Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file mksock /dev/log 0755')
    expect(d.to_s).to include "<kernel>\nfile mksock /dev/log 0755\n"
  end
  it 'Add file mkblock Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file mkblock /dev/loop0 0600 7 0')
    expect(d.to_s).to include "<kernel>\nfile mkblock /dev/loop0 0600 7 0\n"
  end
  it 'Add file mkchar Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file mkchar /dev/console 0755 5 1')
    expect(d.to_s).to include "<kernel>\nfile mkchar /dev/console 0755 5 1\n"
  end
  it 'Add file truncate Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file truncate /etc/mtab')
    expect(d.to_s).to include "<kernel>\nfile truncate /etc/mtab\n"
  end
  it 'Add file symlink Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file symlink /dev/cdrom')
    expect(d.to_s).to include "<kernel>\nfile symlink /dev/cdrom\n"
  end
  it 'Add file link Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file link /etc/mtab~\$ /etc/mtab~')
    expect(d.to_s).to include "<kernel>\nfile link /etc/mtab~\\$ /etc/mtab~\n"
  end
  it 'Add file rename Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file rename /etc/mtab.tmp /etc/mtab')
    expect(d.to_s).to include "<kernel>\nfile rename /etc/mtab.tmp /etc/mtab\n"
  end
  it 'Add file ioctl Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file ioctl socket:[family=2:type=2:protocol=17] 0x8915')
    expect(d.to_s).to include "<kernel>\nfile ioctl socket:[family=2:type=2:protocol=17] 0x8915\n"
  end
  it 'Add file mount Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file mount any / --remount 0x0')
    expect(d.to_s).to include "<kernel>\nfile mount any / --remount 0x0\n"
  end
  it 'Add file unmount Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file unmount /mnt/cdrom/')
    expect(d.to_s).to include "<kernel>\nfile unmount /mnt/cdrom/\n"
  end
  it 'Add file chroot Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file chroot /var/empty/sshd/')
    expect(d.to_s).to include "<kernel>\nfile chroot /var/empty/sshd/\n"
  end
  it 'Add file pivot_root Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('file pivot_root securityfs:/ securityfs:/tomoyo/')
    expect(d.to_s).to include "<kernel>\nfile pivot_root securityfs:/ securityfs:/tomoyo/\n"
  end
  #Misc Policy Test
  it 'Add misc env Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('misc env LD_PRELOAD')
    expect(d.to_s).to include "<kernel>\nmisc env LD_PRELOAD\n"
  end
  #Network Policy Test
  it 'Add network inet Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('network inet stream connect 202.221.179.11 80')
    expect(d.to_s).to include "<kernel>\nnetwork inet stream connect 202.221.179.11 80\n"
  end
  it 'Add network unix Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('network unix stream bind /tmp/.X11-unix/X0')
    expect(d.to_s).to include "<kernel>\nnetwork unix stream bind /tmp/.X11-unix/X0\n"
  end
  it 'Add task manual_dmain_transition Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('task manual_domain_transition <kernel> //apache /www.tomoyo00.com')
    expect(d.to_s).to include "<kernel>\ntask manual_domain_transition <kernel> //apache /www.tomoyo00.com\n"
  end
  it 'Add quota_exceeded Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('quota_exceeded')
    expect(d.to_s).to include "<kernel>\nquota_exceeded\n"
  end
  it 'Add transition_failed Policy' do
    d = TomoyoLinuxRuby::TomoyoDomain.new('<kernel>')
    d.add_policy('transition_failed')
    expect(d.to_s).to include "<kernel>\ntransition_failed\n"
  end
end
