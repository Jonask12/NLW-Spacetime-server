import { FastifyInstance } from "fastify";
import { prisma } from "../lib/prisma";
import { z } from 'zod'

export async function usersRoutes(app: FastifyInstance) {
  app.post('/users', async (request) => {
    const bodySchema = z.object({
      name: z.string(),
      githubId: z.number(),
      login: z.string(),
      avatarUrl: z.string(),
    })
  
    const { name, githubId, avatarUrl, login} = bodySchema.parse(request.body)
  
    const user = await prisma.user.create({
      data: {
        name,
        githubId,
        login,
        avatarUrl,
      }
    })
  
    return user
  })
}