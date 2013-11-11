#!/bin/bash
#demonstration of variable visibility

foo=bar

echo Within first shell \(pid $$\): \$foo=$foo

bash -c "echo Within second shell \(pid \$\$\): \\\$foo=\$foo"
