import { mount } from '@vue/test-utils'
import Counter from '../../resources/js/components/Counter.vue'

describe('Counter.vue', () => {
    test('increments counter val on click', async () => {
        const wrapper = mount(Counter);
        expect(wrapper.vm.counter).toBe(0);
        wrapper.find('button').trigger('click')
        await expect(wrapper.vm.counter).toBe(1);
        expect(wrapper.find('h1').text()).toContain('Click count: 1')
    })
})

describe('Counter.vue', () => {
    test('increment button is dissabled once count is greater than 2', async () => {
        const wrapper = mount(Counter)
        wrapper.setData({ counter: 2 })
        wrapper.find('button').trigger('click')
        await expect(wrapper.vm.counter).toBe(3)
        expect(wrapper.find('button').attributes('disabled')).toBe("disabled")
    })
})
