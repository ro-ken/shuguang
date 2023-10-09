# watch -n 1 'kubectl get pods -n hdu -o custom-columns="NAME:.metadata.name, CPU:.spec.containers[*].resources.requests.cpu, MEMORY:.spec.containers[*].resources.requests.memory, STORAGE:.spec.containers[*].resources.requests.ephemeral-storage" --sort-by=.metadata.name'

#watch -n 1 'kubectl get pods,jobs -n hdu -o custom-columns="TYPE:.kind, NAME:.metadata.name, CPU:.spec.containers[*].resources.requests.cpu, MEMORY:.spec.containers[*].resources.requests.memory, STORAGE:.spec.containers[*].resources.requests.ephemeral-storage" --sort-by=.metadata.name'

sudo watch -n 1 'kubectl get pods,jobs -n hdu -o custom-columns="TYPE:.kind, NAME:.metadata.name, STATUS:.status.phase, CPU:.spec.containers[*].resources.requests.cpu, MEMORY:.spec.containers[*].resources.requests.memory, STORAGE:.spec.containers[*].resources.requests.ephemeral-storage" --sort-by=.metadata.name'

