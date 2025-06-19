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
  Cliente,
} from '../models';
import {VendaRepository} from '../repositories';

export class VendaClienteController {
  constructor(
    @repository(VendaRepository)
    public vendaRepository: VendaRepository,
  ) { }

  @get('/vendas/{id}/cliente', {
    responses: {
      '200': {
        description: 'Cliente belonging to Venda',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Cliente),
          },
        },
      },
    },
  })
  async getCliente(
    @param.path.number('id') id: typeof Venda.prototype.id,
  ): Promise<Cliente> {
    return this.vendaRepository.cliente(id);
  }
}
