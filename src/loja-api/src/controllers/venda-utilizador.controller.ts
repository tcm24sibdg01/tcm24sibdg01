import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Venda,
  Utilizador,
} from '../models';
import {VendaRepository} from '../repositories';

export class VendaUtilizadorController {
  constructor(
    @repository(VendaRepository)
    public vendaRepository: VendaRepository,
  ) { }

  @get('/vendas/{id}/utilizador', {
    responses: {
      '200': {
        description: 'Utilizador belonging to Venda',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Utilizador),
          },
        },
      },
    },
  })
  async getUtilizador(
    @param.path.number('id') id: typeof Venda.prototype.id,
  ): Promise<Utilizador> {
    return this.vendaRepository.utilizador(id);
  }
}
