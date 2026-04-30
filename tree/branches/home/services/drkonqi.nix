{ ... }:
{
  systemd.user.services."drkonqi-coredump-pickup" = {
    Unit.ConditionPathExists = "!/home";
    Service.ExecStart = "/run/current-system/sw/bin/true";
  };
}
