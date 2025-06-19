import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {MysqlDataSource} from '../datasources';
import {Stock, StockRelations, Utilizador} from '../models';
import {UtilizadorRepository} from './utilizador.repository';

export class StockRepository extends DefaultCrudRepository<
  Stock,
  typeof Stock.prototype.id,
  StockRelations
> {

  public readonly utilizador: BelongsToAccessor<Utilizador, typeof Stock.prototype.id>;

  constructor(
    @inject('datasources.mysql') dataSource: MysqlDataSource, @repository.getter('UtilizadorRepository') protected utilizadorRepositoryGetter: Getter<UtilizadorRepository>,
  ) {
    super(Stock, dataSource);
    this.utilizador = this.createBelongsToAccessorFor('utilizador', utilizadorRepositoryGetter,);
    this.registerInclusionResolver('utilizador', this.utilizador.inclusionResolver);
  }
}
