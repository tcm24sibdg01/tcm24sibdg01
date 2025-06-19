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
import {Guitarra} from '../models';
import {GuitarraRepository} from '../repositories';

export class GuitarraController {
  constructor(
    @repository(GuitarraRepository)
    public guitarraRepository : GuitarraRepository,
  ) {}

  @post('/guitarras')
  @response(200, {
    description: 'Guitarra model instance',
    content: {'application/json': {schema: getModelSchemaRef(Guitarra)}},
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Guitarra, {
            title: 'NewGuitarra',
            exclude: ['id'],
          }),
        },
      },
    })
    guitarra: Omit<Guitarra, 'id'>,
  ): Promise<Guitarra> {
    return this.guitarraRepository.create(guitarra);
  }

  @get('/guitarras/count')
  @response(200, {
    description: 'Guitarra model count',
    content: {'application/json': {schema: CountSchema}},
  })
  async count(
    @param.where(Guitarra) where?: Where<Guitarra>,
  ): Promise<Count> {
    return this.guitarraRepository.count(where);
  }

  @get('/guitarras')
  @response(200, {
    description: 'Array of Guitarra model instances',
    content: {
      'application/json': {
        schema: {
          type: 'array',
          items: getModelSchemaRef(Guitarra, {includeRelations: true}),
        },
      },
    },
  })
  async find(
    @param.filter(Guitarra) filter?: Filter<Guitarra>,
  ): Promise<Guitarra[]> {
    return this.guitarraRepository.find(filter);
  }

  @patch('/guitarras')
  @response(200, {
    description: 'Guitarra PATCH success count',
    content: {'application/json': {schema: CountSchema}},
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Guitarra, {partial: true}),
        },
      },
    })
    guitarra: Guitarra,
    @param.where(Guitarra) where?: Where<Guitarra>,
  ): Promise<Count> {
    return this.guitarraRepository.updateAll(guitarra, where);
  }

  @get('/guitarras/{id}')
  @response(200, {
    description: 'Guitarra model instance',
    content: {
      'application/json': {
        schema: getModelSchemaRef(Guitarra, {includeRelations: true}),
      },
    },
  })
  async findById(
    @param.path.string('id') id: string,
    @param.filter(Guitarra, {exclude: 'where'}) filter?: FilterExcludingWhere<Guitarra>
  ): Promise<Guitarra> {
    return this.guitarraRepository.findById(id, filter);
  }

  @patch('/guitarras/{id}')
  @response(204, {
    description: 'Guitarra PATCH success',
  })
  async updateById(
    @param.path.string('id') id: string,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Guitarra, {partial: true}),
        },
      },
    })
    guitarra: Guitarra,
  ): Promise<void> {
    await this.guitarraRepository.updateById(id, guitarra);
  }

  @put('/guitarras/{id}')
  @response(204, {
    description: 'Guitarra PUT success',
  })
  async replaceById(
    @param.path.string('id') id: string,
    @requestBody() guitarra: Guitarra,
  ): Promise<void> {
    await this.guitarraRepository.replaceById(id, guitarra);
  }

  @del('/guitarras/{id}')
  @response(204, {
    description: 'Guitarra DELETE success',
  })
  async deleteById(@param.path.string('id') id: string): Promise<void> {
    await this.guitarraRepository.deleteById(id);
  }
}
