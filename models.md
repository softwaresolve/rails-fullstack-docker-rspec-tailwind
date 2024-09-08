Uma inspecao tem muitos criterios a serem seguidos, cada criterio tem um estado:
- Em revisao
- Revisando
- Aprovado
- Rejeitado

Os criterios pertencem a diferentes areas como:
- Forro
- Piso
- Paredes,
- Etc

Quando um criterio eh aprovado ou reprovado eh criado uma *justificativa*;
Uma justificativa pertence ao criterio respondido anteriormente com uma
descricao e uma imagem (obrigatoria em caso de rejeicao);

Fluxo para revisao de cada criterio eh o seguinte:
    1. Quando inicializado uma nova inspecao, sao copiados as areas que precisam
       ser revisadas para a inspecao. entao, em ordem, cada criterio eh
       percorrido e analisado.

```ruby
class Inspection
    has_many :inspection_criteria
    has_many :criteria, through: :inspection_criteria
end

class Component
    has_many :criteria
end

class Criterion
    belongs_to :component

    has_many :inspection_criteria
    has_many :inspections, through: :inspection_criteria
end

class InspectionCriteria
    # order: string (default: '1.0.0', '1.1.0', '1.2.0')
    # status: string ('approved', 'rejected', 'draft')

    belongs_to :inspection
    belongs_to :criterion

    has_many :justifications
end

class Justification
    # description: string
    # has_one_attached :picture

    belongs_to :inspection_criteria
end
```
