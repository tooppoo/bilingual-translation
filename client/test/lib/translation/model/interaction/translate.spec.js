import { Interaction } from "~/lib/translation/model/interaction";

describe('Interaction#translate', () => {
  let mockGateway
  let sut

  beforeEach(() => {
    mockGateway = {
      translate: jest.fn().mockResolvedValue({
        translated: {
          body: 'translated text',
        },
      }),
    }

    sut = Interaction.translate(mockGateway)
  })

  it('should create data with translated text', async () => {
    await expect(sut({
      source: {
        body: 'source-text'
      },
      target: '',
      language: {
        from: 'en',
        to: 'ja',
      },
    })).resolves.toStrictEqual({
      source: {
        body: 'source-text'
      },
      target: 'translated text',
      language: {
        from: 'en',
        to: 'ja',
      },
    })
  })

  it('should use converted data as request parameter', async () => {
    await sut({
      source: {
        body: `
test 1
test 2

test 3

test 4`,
      },
      target: '',
      language: {
        from: 'en',
        to: 'ja',
      },
    })

    expect({
      language: {
        from: 'en',
        to: 'ja',
      },
      text: [
        `\ntest 1\ntest 2`,
        `test 3`,
        `test 4`
      ]
    }).toStrictEqual(mockGateway.translate.mock.calls[0][0])
  })
})
