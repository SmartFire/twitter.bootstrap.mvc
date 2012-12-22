&{
    $startdir = resolve-path .
    md output -ErrorAction SilentlyContinue
    $outdir = resolve-path .\output
    $templates = resolve-path .\projecttemplates
    $source = resolve-path ..\..\output
    . .\utility.ps1
    . .\vs.ps1 $outdir $templates
    close-solution
    $p = new-mvcapplication foobar
    install-package Newtonsoft.Json

    install-package twitter.bootstrap.mvc4.sample -source $source

    build-project $p
    
    "$startdir"
    set-location ..\..\

}