const cds = require('@sap/cds')

class TaskService extends cds.ApplicationService {
  async init () {
    const { Tasks } = this.entities

    this.before(['CREATE', 'UPDATE'], 'Tasks', async req => {
      const { dueDate } = req.data

      if (dueDate) {
        const today = new Date().toISOString().split('T')[0]

        if (dueDate < today) {
          req.error({
            code: 'PAST_DUE_DATE_NOT_ALLOWED',
            message: 'The due date cannot be set in the past',
            target: 'dueDate',
            status: 400
          })
        }
      }
    })

    return super.init()
  }
}

module.exports = TaskService
