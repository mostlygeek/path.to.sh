# path.to.sh

`path.to.sh` is a simple shell script to populate `/path/to/...` with symlinks to actual files. 

## But why...?

I've been sharing a lot of [llama-swap](https://github.com/mostlygeek/llama-swap) configuration examples. Manually replacing my local paths with `/path/to/file.gguf` is annoying. So why not just make the `/path/to/file.gguf` a symlinks. 

## Install 

1. `sudo mkdir -p /path/to`
2. `sudo chown -R $USER:$USER /path`
3. `cd /path`
4. `curl -LO 'https://raw.githubusercontent.com/mostlygeek/path.to.sh/refs/heads/main/path.to.sh'`
5. `chmod +x path.to.sh`

## Usage 

`./path.to dirname /path1 /path2 /pathN 'file-name-pattern*.gguf`

Example: 

```sh
$ ./path.to.sh models /mnt '*.gguf'
1. Removing broken symlinks in 'to/models'
2. Searching for files matching pattern: *.gguf
  - Linking: /mnt/nvme/models/unsloth/llama-4/UD-Q4_K_XL/Llama-4-Scout-17B-16E-Instruct-UD-Q4_K_XL-00002-of-00002.gguf
  - Linking: /mnt/nvme/models/unsloth/llama-4/UD-Q4_K_XL/Llama-4-Scout-17B-16E-Instruct-UD-Q4_K_XL-00001-of-00002.gguf
  - Linking: /mnt/nvme/models/Llama-3.2-3B-Instruct-Q4_K_M.gguf
  - Linking: /mnt/nvme/models/Qwen3-30B-A3B-UD-Q4_K_XL.gguf
  - Linking: /mnt/nvme/models/Llama-3.3-70B-Instruct-Q4_K_M.gguf
  - Linking: /mnt/nvme/models/Qwen2.5-Coder-7B-Instruct-Q4_K_M.gguf
  - Linking: /mnt/nvme/models/Qwen2.5-Coder-7B-Instruct-Q8_0.gguf
  - Linking: /mnt/nvme/models/Qwen2.5-Coder-32B-Instruct-Q4_K_M.gguf
...


$ ls -l to/models/
total 56
lrwxrwxrwx 1 mostlygeek mostlygeek  47 May 29 12:00 bge-reranker-v2-m3-Q4_K_M.gguf -> /mnt/nvme/models/bge-reranker-v2-m3-Q4_K_M.gguf
lrwxrwxrwx 1 mostlygeek mostlygeek  83 May 29 12:00 CohereForAI_c4ai-command-a-03-2025-Q4_K_L-00001-of-00002.gguf -> /mnt/ssd-extra/models/CohereForAI_c4ai-command-a-03-2025-Q4_K_L-00001-of-00002.gguf
lrwxrwxrwx 1 mostlygeek mostlygeek  83 May 29 12:00 CohereForAI_c4ai-command-a-03-2025-Q4_K_L-00002-of-00002.gguf -> /mnt/ssd-extra/models/CohereForAI_c4ai-command-a-03-2025-Q4_K_L-00002-of-00002.gguf
lrwxrwxrwx 1 mostlygeek mostlygeek  60 May 29 12:00 google_gemma-3-27b-it-Q4_K_L.gguf -> /mnt/nvme/models/bartowski/google_gemma-3-27b-it-Q4_K_L.gguf
lrwxrwxrwx 1 mostlygeek mostlygeek  50 May 29 12:00 Llama-3.2-3B-Instruct-Q4_K_M.gguf -> /mnt/nvme/models/Llama-3.2-3B-Instruct-Q4_K_M.gguf
lrwxrwxrwx 1 mostlygeek mostlygeek  51 May 29 12:00 Llama-3.3-70B-Instruct-Q4_K_M.gguf -> /mnt/nvme/models/Llama-3.3-70B-Instruct-Q4_K_M.gguf
lrwxrwxrwx 1 mostlygeek mostlygeek 101 May 29 12:00 Llama-3.3-70B-Instruct-Q6_K_L-00001-of-00002.gguf -> /mnt/ssd-extra/models/Llama-3.3-70B-Instruct-Q6_K_L/Llama-3.3-70B-Instruct-Q6_K_L-00001-of-00002.gguf
lrwxrwxrwx 1 mostlygeek mostlygeek 101 May 29 12:00 Llama-3.3-70B-Instruct-Q6_K_L-00002-of-00002.gguf -> /mnt/ssd-extra/models/Llama-3.3-70B-Instruct-Q6_K_L/Llama-3.3-70B-Instruct-Q6_K_L-00002-of-00002.gguf
lrwxrwxrwx 1 mostlygeek mostlygeek 105 May 29 12:00 Llama-4-Scout-17B-16E-Instruct-UD-Q4_K_XL-00001-of-00002.gguf -> /mnt/nvme/models/unsloth/llama-4/UD-Q4_K_XL/Llama-4-Scout-17B-16E-Instruct-UD-Q4_K_XL-00001-of-00002.gguf
lrwxrwxrwx 1 mostlygeek mostlygeek 105 May 29 12:00 Llama-4-Scout-17B-16E-Instruct-UD-Q4_K_XL-00002-of-00002.gguf -> /mnt/nvme/models/unsloth/llama-4/UD-Q4_K_XL/Llama-4-Scout-17B-16E-Instruct-UD-Q4_K_XL-00002-of-00002.gguf
lrwxrwxrwx 1 mostlygeek mostlygeek  60 May 29 12:00 Meta-Llama-3.1-8B-Instruct-Q4_K_M.gguf -> /mnt/ssd-extra/models/Meta-Llama-3.1-8B-Instruct-Q4_K_M.gguf
lrwxrwxrwx 1 mostlygeek mostlygeek  58 May 29 12:00 Meta-Llama-3.1-8B-Instruct-Q8_0.gguf -> /mnt/ssd-extra/models/Meta-Llama-3.1-8B-Instruct-Q8_0.gguf
lrwxrwxrwx 1 mostlygeek mostlygeek  76 May 29 12:00 Mistral-Large-Instruct-2407-Q4_K_S-00002-of-00002.gguf -> /mnt/ssd-extra/models/Mistral-Large-Instruct-2407-Q4_K_S-00002-of-00002.gguf
lrwxrwxrwx 1 mostlygeek mostlygeek  72 May 29 12:00 mmproj-Qwen_Qwen2.5-VL-32B-Instruct-bf16.gguf -> /mnt/nvme/models/bartowski/mmproj-Qwen_Qwen2.5-VL-32B-Instruct-bf16.gguf
lrwxrwxrwx 1 mostlygeek mostlygeek  48 May 29 12:00 nomic-embed-text-v1.5.Q8_0.gguf -> /mnt/nvme/models/nomic-embed-text-v1.5.Q8_0.gguf
lrwxrwxrwx 1 mostlygeek mostlygeek  53 May 29 12:00 qwen2.5-0.5b-instruct-q8_0.gguf -> /mnt/ssd-extra/models/qwen2.5-0.5b-instruct-q8_0.gguf
lrwxrwxrwx 1 mostlygeek mostlygeek  54 May 29 12:00 Qwen2.5-32B-Instruct-Q4_K_M.gguf -> /mnt/ssd-extra/models/Qwen2.5-32B-Instruct-Q4_K_M.gguf
...
```
