#!/bin/bash
TMP_BASE_DIR="$HOME/.kind"
TMP_CONFIRMATION="(Press Enter to confirm OR type custom path)"
TMP_SHELL_INFO="\
==============================
| kubeconfig manager for kind 
------------------------------
| \$HOME: \$\$$HOME\$\$
| \$KUBECONFIG: \$\$$KUBECONFIG\$\$
=============================="

func_unset_tmp() {
    unset TMP_BASE_DIR
    unset TMP_CONFIRMATION
    unset TMP_SHELL_INFO
}

# Unset the KUBECONFIG
if [ -n "$KUBECONFIG" ]; then
    unset KUBECONFIG
    echo "env KUBECONFIG is unset"
    func_unset_tmp
    return 0
fi

# Prompt for KUBECONFIG
echo "$TMP_SHELL_INFO"
echo "$TMP_CONFIRMATION"
echo -n "kubeconfig for kind [$TMP_BASE_DIR/kubeconfig]: " 
read CUSTOM_KUBECONFIG

if [ -z "$CUSTOM_KUBECONFIG" ]; then
    if [ ! -d "$TMP_BASE_DIR" ]; then
        mkdir -p "$TMP_BASE_DIR"
    fi
    export KUBECONFIG="$TMP_BASE_DIR/kubeconfig"
    echo "env KUBECONFIG is set to: \$\$$KUBECONFIG\$\$ "
else
    export KUBECONFIG="$CUSTOM_KUBECONFIG"
    echo "env KUBECONFIG is set to: \$\$$KUBECONFIG\$\$ "
fi

func_unset_tmp

