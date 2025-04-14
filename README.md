# llamafile run on OCP

Retrieve `granite-3.2-8b-instruct-Q4_K_M.llamafile` from [Hugging Face](https://huggingface.co/Mozilla/granite-3.2-8b-instruct-llamafile/resolve/main/granite-3.2-8b-instruct-Q4_K_M.llamafile?download=true)

```bash
# To allow using GPU:
oc adm policy add-scc-to-user anyuid -z default

oc new-project llama-test
oc new-build --name llamatest --binary --strategy docker
oc start-build llamatest --from-dir . --follow --wait
oc new-app llamatest
oc expose svc/llamatest

oc get routes
```
