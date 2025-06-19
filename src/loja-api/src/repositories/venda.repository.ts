import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {MysqlDataSource} from '../datasources';
import {Venda, VendaRelations, Cliente, Utilizador} from '../models';
import {ClienteRepository} from './cliente.repository';
import {UtilizadorRepository} from './utilizador.repository';

export class VendaRepository extends DefaultCrudRepository<
  Venda,
  typeof Venda.prototype.id,
  VendaRelations
> {

  public readonly cliente: BelongsToAccessor<Cliente, typeof Venda.prototype.id>;

  public readonly utilizador: BelongsToAccessor<Utilizador, typeof Venda.prototype.id>;

  constructor(
    @inject('datasources.mysql') dataSource: MysqlDataSource, @repository.getter('ClienteRepository') protected clienteRepositoryGetter: Getter<ClienteRepository>, @repository.getter('UtilizadorRepository') protected utilizadorRepositoryGetter: Getter<UtilizadorRepository>,
  ) {
    super(Venda, dataSource);
    this.utilizador = this.createBelongsToAccessorFor('utilizador', utilizadorRepositoryGetter,);
    this.registerInclusionResolver('utilizador', this.utilizador.inclusionResolver);
    this.cliente = this.createBelongsToAccessorFor('cliente', clienteRepositoryGetter,);
    this.registerInclusionResolver('cliente', this.cliente.inclusionResolver);
  }
}
