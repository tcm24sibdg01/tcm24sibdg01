import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {MysqlDataSource} from '../datasources';
import {Guitarra, GuitarraRelations, Venda} from '../models';
import {VendaRepository} from './venda.repository';

export class GuitarraRepository extends DefaultCrudRepository<
  Guitarra,
  typeof Guitarra.prototype.id,
  GuitarraRelations
> {

  public readonly venda: BelongsToAccessor<Venda, typeof Guitarra.prototype.id>;

  constructor(
    @inject('datasources.mysql') dataSource: MysqlDataSource, @repository.getter('VendaRepository') protected vendaRepositoryGetter: Getter<VendaRepository>,
  ) {
    super(Guitarra, dataSource);
    this.venda = this.createBelongsToAccessorFor('venda', vendaRepositoryGetter,);
    this.registerInclusionResolver('venda', this.venda.inclusionResolver);
  }
}
