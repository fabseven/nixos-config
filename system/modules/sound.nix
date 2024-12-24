{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [ pavucontrol ];

	security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
