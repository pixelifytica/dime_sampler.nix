{
  lib,
  buildPythonPackage,
  pythonOlder,
  fetchFromGitHub,
  pip,
  numpy,
  scipy,
  emcee,
  pytestCheckHook,
}:
buildPythonPackage rec {
  pname = "dime_sampler";
  version = "1.0.0";
  disable = pythonOlder "3";
  src = fetchFromGitHub {
    owner = "gboehl";
    repo = pname;
    rev = version;
    hash = "sha256-ncfgJZ6JItBRmJPTmsDmgCkmSlpmzgUUVapH9x8X2gI=";
  };
  dependencies = [
    pip
    numpy
    scipy
    emcee
  ];
  nativeCheckInputs = [ pytestCheckHook ];
  meta = {
    description = "Differential-Independence Mixture Ensemble (“DIME”) MCMC sampling for Python";
    homepage = "https://github.com/gboehl/dime_sampler";
    changelog = "${meta.homepage}/releases/tag/${version}";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.all ];
  };
}
