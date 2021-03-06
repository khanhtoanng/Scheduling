﻿using Scheduling.Data.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Scheduling.Data.Repository
{
    public interface IGenericRepository<TEntity> where TEntity : class
    {
        Task<IEnumerable<TEntity>> Get(int pageIndex = 0, int pageSize = 0, Expression<Func<TEntity, bool>> filter = null,
                                         Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null,
                                         string includeProperties = "");
        Task<TEntity> GetFirst(Expression<Func<TEntity, bool>> filter = null, string includeProperties = "");

        Task<TEntity> GetById(object id);
        void Add(TEntity entity);
        void Delete(object id);
        void Update(TEntity entity);
    }
}
