import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getModelSchemaRef,
  patch,
  put,
  del,
  requestBody,
  response,
} from '@loopback/rest';
import {Venda} from '../models';
import {VendaRepository} from '../repositories';

export class VendaController {
  constructor(
    @repository(VendaRepository)
    public vendaRepository : VendaRepository,
  ) {}

  @post('/vendas')
  @response(200, {
    description: 'Venda model instance',
    content: {'application/json': {schema: getModelSchemaRef(Venda)}},
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Venda, {
            title: 'NewVenda',
            exclude: ['id'],
          }),
        },
      },
    })
    venda: Omit<Venda, 'id'>,
  ): Promise<Venda> {
    return this.vendaRepository.create(venda);
  }

  @get('/vendas/count')
  @response(200, {
    description: 'Venda model count',
    content: {'application/json': {schema: CountSchema}},
  })
  async count(
    @param.where(Venda) where?: Where<Venda>,
  ): Promise<Count> {
    return this.vendaRepository.count(where);
  }

  @get('/vendas')
  @response(200, {
    description: 'Array of Venda model instances',
    content: {
      'application/json': {
        schema: {
          type: 'array',
          items: getModelSchemaRef(Venda, {includeRelations: true}),
        },
      },
    },
  })
  async find(
    @param.filter(Venda) filter?: Filter<Venda>,
  ): Promise<Venda[]> {
    return this.vendaRepository.find(filter);
  }

  @patch('/vendas')
  @response(200, {
    description: 'Venda PATCH success count',
    content: {'application/json': {schema: CountSchema}},
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Venda, {partial: true}),
        },
      },
    })
    venda: Venda,
    @param.where(Venda) where?: Where<Venda>,
  ): Promise<Count> {
    return this.vendaRepository.updateAll(venda, where);
  }

  @get('/vendas/{id}')
  @response(200, {
    description: 'Venda model instance',
    content: {
      'application/json': {
        schema: getModelSchemaRef(Venda, {includeRelations: true}),
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Venda, {exclude: 'where'}) filter?: FilterExcludingWhere<Venda>
  ): Promise<Venda> {
    return this.vendaRepository.findById(id, filter);
  }

  @patch('/vendas/{id}')
  @response(204, {
    description: 'Venda PATCH success',
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Venda, {partial: true}),
        },
      },
    })
    venda: Venda,
  ): Promise<void> {
    await this.vendaRepository.updateById(id, venda);
  }

  @put('/vendas/{id}')
  @response(204, {
    description: 'Venda PUT success',
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() venda: Venda,
  ): Promise<void> {
    await this.vendaRepository.replaceById(id, venda);
  }

  @del('/vendas/{id}')
  @response(204, {
    description: 'Venda DELETE success',
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.vendaRepository.deleteById(id);
  }
}
