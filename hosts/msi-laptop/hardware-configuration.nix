# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  # https://nixos.wiki/wiki/Linux_kernel
  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  # https://github.com/spencerjanssen/dotfiles/blob/2ebf0599456bf5237e64d9fda47449af9704fd71/system/magic-sysrq.nix#L4
  # alt+prnt scr+REISUB
  boot.kernel.sysctl."kernel.sysrq" = 1;
  boot.kernelParams = [
    "pci=realloc" # https://forums.developer.nvidia.com/t/nvidia-kernel-driver-cannot-bind-to-rtx-3060-laptop-gpu/175990/9
  ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/a86a408b-2039-4002-bb13-ae15ae3d6d1a";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/DCF7-772A";
      fsType = "vfat";
    };

  swapDevices = [ ];

  # $ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
  # $ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors 
  # https://askubuntu.com/questions/604720/setting-to-high-performance/1047763#1047763
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
}
