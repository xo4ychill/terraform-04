# Домашнее задание к занятию «Использование Terraform в команде»

### Задание 1
1. Проверка кода с помощью tflint
![alt text](images/error_1.png)
![alt text](images/error_1.1.png)
![alt text](images/error_1.2.png)

    Типы предупреждений/ошибок:
      - terraform_required_providers
      - terraform_unused_declarations
      - terraform_module_pinned_source

2. Проверка кода с помощью checkov (локальный запуск или через docker Checkov не может подключиться к API Prisma Cloud (api0.prismacloud.io) для загрузки маппингов и руководств)
   - ```checkov -d .   --framework terraform   --download-external-modules true   -o json > checkov-report.json```
   - ```docker run --rm  -v "$(pwd):/tf" bridgecrew/checkov -d /tf  --download-external-modules true  -o json > checkov-report.json ```

    Типы предупреждений/ошибок:
      - CKV_TF_1
      - CKV_TF_2
      - CKV_YC_2
      - CKV_YC_11
### Задание 2
