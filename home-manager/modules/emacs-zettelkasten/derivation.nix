{ pkgs ? import <nixpkgs> {} }:

(pkgs.emacsPackagesFor pkgs.emacs).emacsWithPackages (epkgs:
  (with epkgs.melpaStablePackages; []) ++
  (with epkgs.melpaPackages; [
    org-roam
    org-roam-ui

    general

    org-modern # looks
    org-download # easily include stuff
    org-chef # recipes

    consult
    consult-org-roam
    marginalia

    pdf-tools # Ability to open pdf files
    org-pdftools # Let org-mode know about pdfs
  ]) ++
  (with epkgs.elpaPackages; [
    org
    use-package
    vertico
    org-transclusion # share text between files
  ])
)
