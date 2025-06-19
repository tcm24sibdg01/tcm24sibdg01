import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Guitarra,
  Venda,
} from '../models';
import {GuitarraRepository} from '../repositories';

export class GuitarraVendaController {
  constructor(
    @repository(GuitarraRepository)
    public guitarraRepository: GuitarraRepository,
  ) { }

  @get('/guitarras/{id}/venda', {
    responses: {
      '200': {
        description: 'Venda belonging to Guitarra',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Venda),
          },
        },
      },
    },
  })
  async getVenda(
    @param.path.string('id') id: typeof Guitarra.prototype.id,
  ): Promise<Venda> {
    return this.guitarraRepository.venda(id);
  }
}
