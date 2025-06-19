import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Stock,
  Utilizador,
} from '../models';
import {StockRepository} from '../repositories';

export class StockUtilizadorController {
  constructor(
    @repository(StockRepository)
    public stockRepository: StockRepository,
  ) { }

  @get('/stocks/{id}/utilizador', {
    responses: {
      '200': {
        description: 'Utilizador belonging to Stock',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Utilizador),
          },
        },
      },
    },
  })
  async getUtilizador(
    @param.path.number('id') id: typeof Stock.prototype.id,
  ): Promise<Utilizador> {
    return this.stockRepository.utilizador(id);
  }
}
