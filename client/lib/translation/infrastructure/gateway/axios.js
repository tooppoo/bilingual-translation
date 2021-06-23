
export const translateGateway = {
  build: axios => ({
    async translate(params) {
      const res = await axios.post(
        '/api/translation',
        params
      )

      return res.data
    }
  })
}
