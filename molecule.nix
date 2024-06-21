{ buildPythonPackage
, fetchFromGitHub
, setuptools
}:
buildPythonPackage rec {
  pname = "molecule-plugins[docker]";
  version = "23.5.3";
  build-system = [
    setuptools
  ];
  src = fetchFromGitHub {
    owner = "ansible-community";
    repo = "molecule-plugins";
    rev = "v${version}";
    sha256 = "sha256-v0yj2RztsRoWIUw8FYLuMMZihY3R9eJrA8ikQpEpwJ0=";
  };
  doCheck = false;
}

