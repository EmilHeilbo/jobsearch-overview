// src/routes/+page.server.ts

import prisma from '$lib/prisma';
import type { PageServerLoad } from './$types';

export const load = (async () => {
// 1.
const users = await prisma.user.findMany()
const jobs = await prisma.job.findMany({ include: { applicant: true }})

// 2.
return { jobs: jobs, users: users };
}) satisfies PageServerLoad;