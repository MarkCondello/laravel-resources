import { shallowMount, mount } from "@vue/test-utils"
import TestMockApi from '../../resources/js/components/TestMockApi.vue'
import flushPromises from 'flush-promises'

import { getValue } from '../../resources/js/services/axios.js'

jest.mock('../../resources/js/services/axios.js'); 

describe('TestMockApi', () => {
  test('fetches async get when button is clicked', async () => {
    const wrapper = shallowMount(TestMockApi)
    wrapper.find('button').trigger('click')
    await flushPromises()
    expect(wrapper.find('p').text()).toBe('get value.')
  })

  test('fetches mocked async get when button is clicked', async () => {
    const wrapper = mount(TestMockApi)
    getValue.mockResolvedValueOnce({ data: 'mocked value.'})
    wrapper.find('button').trigger('click')
    expect(getValue).toHaveBeenCalledTimes(1)
    await flushPromises()
    const pVal = wrapper.find('p').text()
    console.log({pVal})
    expect(pVal).toBe('mocked value.')
  })

  //set methods is deprecated
  // it('fires the fetchResults method on button click', async () => {
  //   const wrapper = mount(TestMockApi)
  //   //https://vue-test-utils.vuejs.org/api/wrapper-array/#setmethods
  //   wrapper.setMethods({
  //     fetchResults: jest.fn()
  //   })
  //   wrapper.find('button').trigger('click')
  //   expect(wrapper.vm.fetchResults).toHaveBeenCalled()
  // })

})