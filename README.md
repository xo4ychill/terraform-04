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

2. Проверка кода с помощью checkov (локальный запуск или через docker, Checkov не может подключиться к API Prisma Cloud (api0.prismacloud.io) для загрузки маппингов и руководств)
   - ```checkov -d .   --framework terraform   --download-external-modules true   -o json > checkov-report.json```
   - ```docker run --rm  -v "$(pwd):/tf" bridgecrew/checkov -d /tf  --download-external-modules true  -o json > checkov-report.json ```

    Типы предупреждений/ошибок:
      - CKV_TF_1
      - CKV_TF_2
      - CKV_YC_2
      - CKV_YC_11

### Задание 2
1. Создаем ветку 'terraform-05' в ветке 'terraform-04'
![alt text](../Terraform-05/images/tr05-2.png)
2. Настраиваем remote state с встроенными блокировками:
    - S3 bucket в Yandex Cloud для хранения state
![alt text](images/tr05-2.1.png)
    - service account с правами на чтение/запись в bucket
![alt text](images/tr05-2.2.png)
![alt text](images/tr05-2.3.png)
![alt text](images/tr05-2.4.png)
    - [backend в providers.tf с использованием нового механизма блокировок](src/providers.tf)
    - `terraform init -migrate-state`
![alt text](images/tr05-2.5.png)
3. Коммит в ветку 'terraform-05' все изменения.
![alt text](images/tr05-2.8.png)
5. Ответ об ошибке доступа к state (блокировка должна сработать автоматически)
![alt text](tr05-2.6.png)
6. Принудительная разблокировка state командой `terraform force-unlock <LOCK_ID>`
![alt text](images/tr05-2.7.png)

### Задание 3 
