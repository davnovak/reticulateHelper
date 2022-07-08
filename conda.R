
conda_activate <- function(
  env_name
) {
  
  cl <- reticulate::conda_list()
  if (!env_name %in% cl$name) {
    stop('Anaconda environment "', env_name, '" not found')
  }
  python_path <- cl$python[cl$name == env_name]
  
  if ('reticulate' %in% loadedNamespaces()) {
    unloadNamespace('reticulate')
  }
  Sys.setenv(RETICULATE_PYTHON = python_path)
  
  reticulate::use_condaenv(condaenv = env_name)
}

conda_run <- function(
  f,
  par = NULL,
  env_name = 'r-reticulate'
) {
  old_python <- Sys.getenv('RETICULATE_PYTHON')
  
  conda_activate(env_name = env_name, verbose = verbose)
  do.call(f, par)
  
  if ('reticulate' %in% loadedNamespaces()) {
    unloadNamespace('reticulate')
  }
  Sys.setenv(RETICULATE_PYTHON = old_python)
}



